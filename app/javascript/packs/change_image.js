const initChangeImage = () => {
	const bigPic = document.getElementById("main-pic");
	let smallPics = [];
	smallPics = document.querySelectorAll(".small-pics");
	smallPics.forEach((smallPic) => {
		smallPic.addEventListener("click", (event) => {
			togglePics(smallPic, bigPic);
		});
	});
}

const togglePics = (smallPic, bigPic) => {
	let bisSrc = bigPic.src;
	let smallSrc = smallPic.src;
	bigPic.src = smallSrc;
	smallPic.src = bisSrc;
}

export { initChangeImage };