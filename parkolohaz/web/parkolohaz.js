async function velemenyKuldes(){
    let name = document.getElementById('name');
    let email = document.getElementById('email');
    let phone = document.getElementById('phone');
    let message = document.getElementById('message');

    if(!name.value || !email.value || !phone.value || !message.value ){
        alert('Kérjük, minden mezőt töltsön ki!');
        return;
    }

    body = JSON.stringify({
        name: name.value,
        email: email.value,
        phone: phone.value,
        message: phone.value
    })
       
     
    let response = await fetch('api/kapcsolat', {
        method: 'POST',
        body: body,
        headers: {
            "Content-type": "application/json"
        }
    });

    if(response.status != 200){
        return;
    }
    alert("Munkatársunk keresni fogja önt!")

    name.value = "";
    email.value = "";
    phone.value = "";
    message.value = "";
}

let szamlalo;
window.onload = ()=> {
    szamlalo = 0;
    setInterval(novel, 8000);
}

function novel(){
    szamlalo += 1;
    document.getElementById('szamlalo').innerHTML = szamlalo;
}

setInterval(novel, 500);
