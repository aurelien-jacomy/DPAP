const initSelectDeliveryPoint = () => {
	let cards = [];
	cards = document.querySelectorAll(".card-address")
	cards.forEach((card) => {
		card.addEventListener( "click", (event) => { 
			toggleCards(card, cards);
		});
	});
}

const toggleCards = (selected_card, cards) => {
	cards.forEach( (card) => {
		if ( selected_card === card ) {
			card.classList.add("selected");
			const deliveryPointId = card.dataset.delivery;
			updateDeliveryPoint(deliveryPointId);
		} else {
			card.classList.remove("selected");
		}
	});
}

const updateDeliveryPoint = (id) => {
	document.getElementById("delivery-point-id").value = id;
}

export { initSelectDeliveryPoint } ;