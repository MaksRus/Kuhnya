document.querySelectorAll('.js-confirm').forEach(function(link){
    link.addEventListener('click', askConfirm);
})

function askConfirm(event){
    event.preventDefault();
    const url = this.href;

    if(confirm('Cette action est irréversible. Continuer malgré tout ?')) location.replace(url);
}