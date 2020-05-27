const initSelectDeliveryPoint = () => {
	console.log("init loaded")
	let cards = [];
	cards = document.querySelectorAll(".card-address")
	cards.forEach((card) => {
		card.addEventListener( "click", (event) => { 
			toogleCards(card, cards);
		});
	});
};

const toogleCards = (selected_card, cards) => {
	cards.forEach( (card) => {
		if ( selected_card === card ) {
			card.classList.add("selected");
		} else { 
			card.classList.remove("selected");
		}
	});
}

export { initSelectDeliveryPoint } ;