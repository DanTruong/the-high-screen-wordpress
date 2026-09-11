(function() {
	"use strict";
	const e = React.createElement;
	const POSTS_TO_SHOW = 12;

	function Navigation() {
		const [categories, setCategories] = React.useState([]);
		const [loading, setLoading] = React.useState(true);
		const [error, setError] = React.useState(null);

		React.useEffect(
			function() {
				fetch(
					window.thsConfig.apiBase +
					"categories?per_page=100"
				)
					.then(function(response) {
						if (!response.ok) {
							throw new Error(
								"Unable to load categories (HTTP " +
								response.status +
								")."
							);
						}

						return response.json();
					})
					.then(function(data) {
						setCategories(data);
						setLoading(false);
					})
					.catch(function(fetchError) {
						setError(fetchError.message);
						setLoading(false);
					});
			},
			[]
		);

		if (loading) {
			return e(
				"li",
				{className: "nav-item"},
				e(
					"span",
					{className: "nav-link"},
					"Loading..."
				)
			);
		}

		if (error) {
			return null;
		}

		return e(
			React.Fragment,
			null,

			categories.map(function(category) {
				return e(
					"li",
					{
						className: "nav-item",
						key: category.id
					},

					e(
						"a",
						{
							className: "nav-link",
							href:
								"/category.html?slug=" +
								encodeURIComponent(category.slug)
						},
						category.name
					)
				);
			}),

			e(
				"li",
				{className: "nav-item"},

				e(
					"a",
					{
						className: "nav-link",
						href: "/"
					},
					"Archive"
				)
			),

			e(
				"li",
				{className: "nav-item"},

				e(
					"a",
					{
						className: "nav-link",
						href: "/page.html?slug=about"
					},
					"About"
				)
			)
		);
	}

	function CategoryPosts(props) {
		const slug = props.slug;

		const [category, setCategory] =
			React.useState(null);

		const [posts, setPosts] =
			React.useState([]);

		const [loading, setLoading] =
			React.useState(true);

		const [error, setError] =
			React.useState(null);

		React.useEffect(
			function() {
				let cancelled = false;

				const categoryUrl =
					window.thsConfig.apiBase +
					"categories?slug=" +
					encodeURIComponent(slug);

				fetch(categoryUrl)
					.then(function(response) {
						if (!response.ok) {
							throw new Error(
								"Unable to load category (HTTP " +
								response.status +
								")."
							);
						}

						return response.json();
					})
					.then(function(categories) {
						if (
							cancelled ||
							!categories.length
						) {
							if (!categories.length) {
								throw new Error(
									"Category not found."
								);
							}

							return;
						}

						const foundCategory =
							categories[0];

						setCategory(foundCategory);

						const postsUrl =
							window.thsConfig.apiBase +
							"posts?categories=" +
							foundCategory.id +
							"&per_page=100&_embed";

						return fetch(postsUrl);
					})
					.then(function(response) {
						if (!response) {
							return null;
						}

						if (!response.ok) {
							throw new Error(
								"Unable to load category posts (HTTP " +
								response.status +
								")."
							);
						}

						return response.json();
					})
					.then(function(data) {
						if (
							cancelled ||
							!data
						) {
							return;
						}

						setPosts(data);
						setLoading(false);
					})
					.catch(function(fetchError) {
						if (cancelled) {
							return;
						}

						setError(fetchError.message);
						setLoading(false);
					});

				return function() {
					cancelled = true;
				};
			},
			[slug]
		);

		React.useEffect(
			function() {
				if (!category) {
					return;
				}

				document.title =
					category.name +
					" | The High Screen";

				const titleElement =
					document.getElementById(
						"category-title"
					);

				if (titleElement) {
					titleElement.textContent =
						category.name;
				}
			},
			[category]
		);

		if (loading) {
			return e(
				"p",
				{className: "text-body-secondary"},
				"Loading articles..."
			);
		}

		if (error) {
			return e(
				"div",
				{className: "alert alert-danger"},
				error
			);
		}

		if (!posts.length) {
			return e(
				"p",
				null,
				"No articles were found in this category."
			);
		}

		return e(
			React.Fragment,
			null,

			posts.map(function(post) {
				return e(
					PostPreview,
					{
						post: post,
						key: post.id
					}
				);
			})
		);
	}

	//Utility functions
	function formatDate(dateValue) {
		if (!dateValue) {
			return "";
		}

		const date = new Date(dateValue);

		if (Number.isNaN(date.getTime())) {
			return dateValue;
		}

		return new Intl.DateTimeFormat("en-US", {
			year: "numeric",
			month: "long",
			day: "numeric"
		}).format(date);
	}

	// Builds the URL that the homepage uses when someone clicks an article.
	function getPostPageUrl(post) {
		if (!post.id) {
			return "#";
		}

		return "post.html?id=" + encodeURIComponent(post.id);
	}

	//Homepage components
	function PostPreview(props) {
		const post = props.post;
		const isLast = props.isLast;

		const title =
			post.title && post.title.rendered
				? post.title.rendered
				: "Untitled";

		const excerpt =
			post.excerpt && post.excerpt.rendered
				? post.excerpt.rendered
				: "";

		const author =
			post._embedded &&
			post._embedded.author &&
			post._embedded.author[0]
				? post._embedded.author[0].name
				: "The High Screen";

		const date = formatDate(post.date);

		return e(React.Fragment, null, 
				e("article", {className: "post-preview"},
				e(
					"a", {href: getPostPageUrl(post)},
					e("h2", {className: "post-title"}, title),
					excerpt ?
					e("h3", {className: "post-subtitle"}, excerpt) : null
				),
				e(
					"p", {className: "post-meta"},
					"Posted by ", e("span", null, author), date ? " on " + date : ""
				)
			),
			!isLast ?
			e("hr", {className: "my-4"}) : null
		);
	}

	function PostList(props) {
		const postsUrl = props.postsUrl;
		const [posts, setPosts] = React.useState([]);
		const [loading, setLoading] = React.useState(true);
		const [error, setError] = React.useState(null);

		React.useEffect(
			function() {
				let cancelled = false;

				fetch(postsUrl)
					.then(function(response) {
						if (!response.ok) {
							throw new Error(
								"Unable to load WordPress posts (HTTP " +
								response.status +
								")."
							);
						}

						return response.json();
					})

					.then(function(data) {
						if (cancelled) {
							return;
						}
						const postArray =
							Array.isArray(data)
								? data
								: [];

						setPosts(postArray);
						setLoading(false);
					})

					.catch(function(fetchError) {
						if (!cancelled) {
							console.error(fetchError);

							setError(
								fetchError.message
							);

							setLoading(false);
						}
					});


				return function() {
					cancelled = true;
				};
			},

			[postsUrl]
		);


		if (loading) {
			return e(
				"p", {
					className: "text-body-secondary"
				},
				"Loading posts..."
			);
		}


		if (error) {
			return e(
				"div", {
					className: "alert alert-danger",
					role: "alert"
				},

				"The post list could not be loaded. " +
				error
			);
		}


		if (posts.length === 0) {
			return e("p", null, "No posts are currently available.");
		}

		return e(
			React.Fragment,
			null,

			posts.map(
				function(post, index) {
					return e(
						PostPreview,
						{
							key: post.id || post.slug || index,
							post: post,
							isLast: index === posts.length - 1
						}
					);
				}
			)
		);

	}

	//Individual article component
	function Post(props) {
		const postUrl = props.postUrl;

		const [post, setPost] = React.useState(null);
		const [loading, setLoading] = React.useState(true);
		const [error, setError] = React.useState(null);

		React.useEffect(
			function() {
				let cancelled = false;

				fetch(postUrl)
					.then(function(response) {
						if (!response.ok) {
							throw new Error(
								"Unable to load article (HTTP " +
								response.status +
								")."
							);
						}

						return response.json();
					})
					.then(function(data) {
						if (cancelled) {
							return;
						}

						setPost(data);
						setLoading(false);
					})
					.catch(function(fetchError) {
						if (cancelled) {
							return;
						}

						setError(fetchError.message);
						setLoading(false);
					});

				return function() {
					cancelled = true;
				};
			},
			[postUrl]
		);

		if (loading) {
			return e(
				"p",
				{className: "text-body-secondary"},
				"Loading article..."
			);
		}

		if (error) {
			return e(
				"div",
				{className: "alert alert-danger"},
				error
			);
		}

		if (!post) {
			return null;
		}

		const title =
			post.title && post.title.rendered
				? post.title.rendered
				: "Untitled";

		const content =
			post.content && post.content.rendered
				? post.content.rendered
				: "";

		const author =
			post._embedded &&
			post._embedded.author &&
			post._embedded.author[0]
				? post._embedded.author[0].name
				: "The High Screen";

		const date = formatDate(post.date);

		return e(
			"article",
			{className: "post"},

			e(
				"h1",
				{
					className: "post-title",
					dangerouslySetInnerHTML: {
						__html: title
					}
				}
			),

			e(
				"p",
				{className: "post-meta"},
				"Posted by ",
				e(
					"span",
					{className: "post-author"},
					author
				),
				date
					? " on " + date
					: ""
			),

			e("hr"),

			e(
				"div",
				{
					className: "post-content",
					dangerouslySetInnerHTML: {
						__html: content
					}
				}
			)
		);
	}


/*
* ------------------------------------------------------------
* React initialization
* ------------------------------------------------------------
*/
	/*
	 * NAVBAR
	 */
	const navigationElement =
		document.getElementById("navigation");

	if (navigationElement) {
		ReactDOM.createRoot(navigationElement).render(
			e(Navigation)
		);
	}

	/*
	 * HOMEPAGE
	 */
	const postListElement =
		document.getElementById("post-list");

	if (postListElement) {
		const postsUrl =
			window.thsConfig.apiBase +
			"posts?per_page=" +
			POSTS_TO_SHOW +
			"&_embed";

		ReactDOM.createRoot(postListElement).render(
			e(PostList, {
				postsUrl: postsUrl
			})
		);
	}

	/*
	 * INDIVIDUAL POST PAGE
	 */
	const postElement = document.getElementById("post");

	if (postElement) {
		const params = new URLSearchParams(window.location.search);
		const postId = params.get("id");

		if (!postId) {
			postElement.innerHTML =
				"<p>Unable to load article: no post ID was supplied.</p>";
		} else {
			const postUrl =
				window.thsConfig.apiBase +
				"posts/" +
				encodeURIComponent(postId) +
				"?_embed";

			ReactDOM.createRoot(postElement).render(
				e(Post, {
					postUrl: postUrl
				})
			);
		}
	}

	/*
	 * CATEGORY
	 */
	const categoryPostsElement =
		document.getElementById("category-posts");

	if (categoryPostsElement) {
		const params =
			new URLSearchParams(window.location.search);

		const categorySlug =
			params.get("slug");

		if (!categorySlug) {
			categoryPostsElement.innerHTML =
				'<div class="alert alert-danger">' +
				"No category was specified." +
				"</div>";
		} else {
			ReactDOM.createRoot(
				categoryPostsElement
			).render(
				e(CategoryPosts, {
					slug: categorySlug
				})
			);
		}
	}

})();