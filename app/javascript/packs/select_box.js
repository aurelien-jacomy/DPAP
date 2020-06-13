const initSelectLabel = () => {
	let labels = [];
	labels = document.querySelectorAll(".label-choice")
	labels.forEach((label) => {
		label.addEventListener( "click", (event) => {
			label.classList.toggle("active");
		});
	});
}

const initSelectLabelCategory = () => {
	let categories = [];
	categories = document.querySelectorAll(".category-choice")
	categories.forEach((category) => {
		category.addEventListener( "click", (event) => {
			category.classList.toggle("active");
			toggleLabel(category.dataset.category);
		});
	});
}

const toggleLabel = (id) => {
	
}

export { initSelectLabel, initSelectLabelCategory };