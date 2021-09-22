// Custom dropdown menu https://www.w3schools.com/howto/howto_js_dropdown.asp

/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */

function guessOneDropdown(){
  document.getElementById('guessOne').classList.toggle('show');
}
function guessTwoDropdown(){
  document.getElementById('guessTwo').classList.toggle('show');
}
function guessThreeDropdown(){
  document.getElementById('guessThree').classList.toggle('show');
}
function guessFourDropdown(){
  document.getElementById('guessFour').classList.toggle('show');
}

function guessPegGuess(peg, color){
  var el = document.getElementById('guessPeg' + peg);
  el.classList.remove(el.value);
  el.classList.add(color);
  el.value = color;
}


// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName('dropdown-content');
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

function showHelp(){
	var helpElement = document.getElementById('helpSection');
	if (helpElement.style.opacity == 0){
		helpElement.style.opacity = 1;
		helpElement.style.pointerEvents = 'unset';
	} else {
		helpElement.style.opacity = 0;
		helpElement.style.pointerEvents = 'none';
	}
}
