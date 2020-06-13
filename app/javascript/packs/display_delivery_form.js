const displayDeliveryForm = () => {
	document
		.querySelector(".btn.delivery-point-form")
		.addEventListener("click", (event) => {
			document.getElementById("delivery-point-form").classList.remove("hidden");
		});
		
}

export { displayDeliveryForm };