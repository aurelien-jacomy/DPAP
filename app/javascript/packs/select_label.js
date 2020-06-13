const initSelectLabel = () => {
	let labels = [];
	labels = document.querySelectorAll(".label-choice")
	labels.forEach((label) => {
		label.addEventListener( "click", (event) => {
			console.log(label);
			console.log(event.currentTarget);
			label.classList.toggle("active");
		});
	});
}

export { initSelectLabel };