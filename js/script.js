/*jslint browser: true*/
/*global $, jQuery*/

// Set event listener with modal window to notify user, when he/she is entering quotes.

document.addEventListener("keydown", function (event) {
  "use strict";
  if (event.which === 222) {
	  $('#modal6').openModal();
	  return;
  }
});

// Set the main function and all vars.

function getInfo() {
	"use strict";
	var imgUrl = document.getElementById("userUrl").value,
		imgClass = document.getElementById("userClass").value,
		imgAlt = document.getElementById("userAlt").value,
		imgID = document.getElementById("userID").value,
		randomID = "img-" + Math.floor((Math.random() * 10000) + 1),
		imgIdOn = document.getElementById('autoON').checked,
		imgIdOff = document.getElementById('autoOFF').checked,
		prevImg = '<img src="' + imgUrl + '" id="' + randomID + '" class="' + imgClass + '" alt="' + imgAlt + '" />',
		resultCode = '<img src="' + imgUrl + '" id="' + randomID + '" class="' + imgClass + '" alt="' + imgAlt + '" />',
		resultCode2 = '<img src="' + imgUrl + '" id="' + imgID + '" class="' + imgClass + '" alt="' + imgAlt + '" />',
		halfUrl = imgUrl.includes("http");
	
    // Find out if the URL is correct.	
	if (halfUrl === false) {
		$('#modal7').openModal();
		return;
	}
  
	// Prevent generating code with quotes.
	if (imgUrl.indexOf("\'") >= 0 || imgUrl.indexOf("\"") >= 0 || imgClass.indexOf("\'") >= 0 || imgClass.indexOf("\"") >= 0 ||
	            imgAlt.indexOf("\'") >= 0 || imgAlt.indexOf("\"") >= 0 || imgID.indexOf("\'") >= 0 || imgID.indexOf("\"") >= 0) {
		$('#modal6').openModal();
		return;
	}

	// Detect missing fields - url, class and alt tag.
	if (imgUrl === undefined || imgUrl  === null || imgUrl === "") {
		$('#modal3').openModal();
		return;
	} else if (imgClass === undefined || imgClass  === null || imgClass === "") {
		$('#modal4').openModal();
		return;
	} else if (imgAlt === undefined || imgAlt  === null || imgAlt === "") {
		$('#modal5').openModal();
		return;
	}
	
	
	// Printing the code and Image preview + Test for ID tag.
	if (imgIdOn === false && imgIdOff === false) {
		$('#modal2').openModal();
	} else {
		if (imgIdOn === true) {
			document.getElementById("preview").innerHTML = prevImg;
			document.getElementById("result").textContent = resultCode;
		} else if (imgIdOff === true) {
			if (imgID === undefined || imgID === null || imgID === "") {
				$('#modal1').openModal();
			} else {
				document.getElementById("preview").innerHTML = prevImg;
				document.getElementById("result").textContent = resultCode2;
			}
		
		
		}
	}

}

// Set the dictionary variable for translation.

var dict = {
  "Снимки": {
    en: "Images",
    bg: "Снимки"
  },
  "Линкове": {
    en: "Links",
    bg: "Линкове"
  },
  "Елемент": {
    en: "Attribute",
    bg: "Елемент"
  },
  "Стойност": {
    en: "Value",
    bg: "Стойност"
  },
  "Адрес на снимката": {
    en: "Image Adress",
    bg: "Адрес на снимката"
  },
  "Клас": {
    en: "Class",
    bg: "Клас"
  },
  "Алт таг": {
    en: "ALT tag",
    bg: "Алт таг"
  },
  "Сложи автоматично ID": {
    en: "Put auto ID",
    bg: "Сложи автоматично ID"
  },
  "Задай ръчно ID таг": {
    en: "Set manual ID tag",
    bg: "Задай ръчно ID таг"
  },
  "Генерирай код!": {
    en: "Generate Code!",
    bg: "Генерирай код!"
  },
  "Предварителен Изглед:": {
    en: "Image Preview:",
    bg: "Предварителен Изглед:"
  },
  "Моля, въведи текст в полето за ID таг.": {
    en: "Please, put some text in field for ID tag.",
    bg: "Моля, въведи текст в полето за ID таг."
  }
};

// Set the main language of the site, when is loaded for first time.

var translator = $('body').translate({lang: "bg", t: dict});