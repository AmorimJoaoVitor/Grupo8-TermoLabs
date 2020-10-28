function instalar() {
    var camara = Number(valorInput.value);
    
    if (camara > 10) {
       var calc = 150;
    }
    calc = camara * 10 + 150 + 500;

    resultado.innerHTML = `O custo de instalação do 
                              nosso sistema vai ser de R$${calc}`;
}