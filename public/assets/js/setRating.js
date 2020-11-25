document.querySelectorAll('a.js-like').forEach(function(link){
    link.addEventListener('click', onClickBtnLike);
})

function onClickBtnLike(event){
    event.preventDefault();

    const url = this.href;
    const spanCount = this.closest('.col').querySelector("#js-likes-count");
    const average = spanCount.parentElement.querySelector('#js-likes-average');
    const msg = this.parentElement.parentElement.querySelector('#js-liked');

    axios.get(url).then(function(response){
        if(response.status === 200){
            spanCount.textContent = response.data.likes;
            average.textContent = response.data.average;
            msg.textContent = "Votre note : " + response.data.rating;
        }
    }).catch(function(error){
        msg.innerHTML = "<a href='/connexion'> Connectez vous pour évaluer les recettes !</a>";
    })

}