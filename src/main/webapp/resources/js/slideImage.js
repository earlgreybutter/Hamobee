// For background slide button
var slideIndex = 0;
changeSlideImage(slideIndex);
changeSlideImageByTimer();



function moveSlideImage(n) {
	slideIndex = n;
	changeSlideImage(slideIndex);
}



function changeSlideImage(n) {
	n %= 3;
	for(var i = 0; i < 3; i++){
		if(i == n) {
			$('.slideBackground0' + i).css('display', 'block');
			$('.w3-badge:nth-child(' + (i+1) + ')').addClass('w3-grey');
		}
		else {
			$('.slideBackground0' + i).css('display', 'none');
			$('.w3-badge:nth-child(' + (i+1) + ')').removeClass('w3-grey');
		}
	}
}



function changeSlideImageByTimer() {
	moveSlideImage(slideIndex + 1)
	setTimeout(changeSlideImageByTimer, 10000); // Change image every 2 seconds
}
