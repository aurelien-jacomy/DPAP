const showDeliveryPart = () => {
	document.getElementById("validate-cart")
		.addEventListener("click", (event) => {
			document.getElementById("delivery-part").classList.remove("hidden");
		});
}

export { showDeliveryPart };