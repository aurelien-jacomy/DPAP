const showLabel = () => {
	let labels = [];
	labels = document.querySelectorAll(".card-label");
	labels.forEach((label) => {
		label.querySelector(".card-label-header-content").addEventListener( "click", (event) => {
			label.querySelector(".card-label-content").toggleAttribute("hidden");
		})
	});
}

export { showLabel };