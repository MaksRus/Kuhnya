document.querySelectorAll('.js-modifyGuest').forEach(function(button){
    button.addEventListener('click', modifyGuestsNumber);
})


/**
 * Dynamically modifies ingredient quantities depending on Guests Number
 */
function modifyGuestsNumber(){
    const operation = (this.classList.contains('fa-plus-square'))? '+' : '-';
    const guestsDisplay = document.getElementById('nbGuests');
    const oldGuestsNumber = parseFloat(guestsDisplay.textContent);

    const newGuestsNumber = (operation === "+")? oldGuestsNumber+1 : oldGuestsNumber-1;

    //Allows a number of guests between 1 and 20
    if (newGuestsNumber > 0 && newGuestsNumber < 21){
        guestsDisplay.textContent = newGuestsNumber;

        //Modify quantities
        document.querySelectorAll('.quantity').forEach(function(display){
            const quantity = parseFloat(display.textContent);
            const modifier = newGuestsNumber/oldGuestsNumber;

            display.textContent = Math.round((quantity*modifier)*100)/100;
            
        })
    }

}