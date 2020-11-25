let $ingredientsHolder;

$(document).ready(function(){
    //get Collection holder
    $ingredientsHolder = $('#ingredients-list');

    $ingredientsHolder.data('index', $ingredientsHolder.find('input').length);

    //AddRemoveButton
    $ingredientsHolder.find('.js-ingredient').each(function(){
        addRemoveBtn($(this));
    })

    //add new IngredientForm
    $('#js-add').click(function(e){
        const $ingredientsHolderClass = $(e.currentTarget).data('ingredientsHolderClass');
        addIngredientRow($ingredientsHolderClass);
    })
    
})

function addIngredientRow($ingredientsHolderClass){
    //get the prototype
    let prototype = $ingredientsHolder.data('prototype');
    //get index
    let index = $ingredientsHolder.data('index');
    //increment index
    $ingredientsHolder.data('index', index+1);

    //create formRow
    let newForm = prototype;
    newForm = newForm.replace(/__name__/g, index);
    
    //append Row
    $('#ingredients-list').append(newForm);

    addRemoveBtn($('#ingredients-list .row:last-child'));
}

function addRemoveBtn($row){
    //create Remove Button
    let $removeBtn = $('<button class="btn btn-danger js-remove">Retirer un Ingrédient</button>')
    let $removeCol = $('<div class="col align-self-center"></div>').append($removeBtn);

    $row.append($removeCol);
    
    //create EventListener
    $removeBtn.click(function(e){
        e.preventDefault();

        let $ingredientRow = ($(e.target).parents('.js-ingredient'));
        $ingredientRow.remove();
    });
}
