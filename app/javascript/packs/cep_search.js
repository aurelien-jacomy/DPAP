const getCEP = () => {
  $("#cep").blur(function () {
    var cep = $(this).val().replace(/\D/g, "");

    if (cep != "") {
      var validacep = /^[0-9]{8}$/;

      if (validacep.test(cep)) {
        $.getJSON(
          "https://viacep.com.br/ws/" + cep + "/json/?callback=?",
          function (dados) {
            if (!("erro" in dados)) {
              $("#rua").val(dados.logradouro);
              $("#bairro").val(dados.bairro);
              $("#cidade").val(dados.localidade);
              $("#uf").val(dados.uf);              
            } else {
              alert("CEP não encontrado.");
            }
          }
        );
      } else {
        alert("Formato de CEP inválido.");
      }
    }
  });
};

export { getCEP };
