const getCEP = () => {
  $("#company_cep").blur(function () {
    var cep = $(this).val().replace(/\D/g, "");

    if (cep != "") {
      var validacep = /^[0-9]{8}$/;

      if (validacep.test(cep)) {
        $.getJSON(
          "https://viacep.com.br/ws/" + cep + "/json/?callback=?",
          function (dados) {
            if (!("erro" in dados)) {
              $("#company_rua").val(dados.logradouro);
              $("#company_bairro").val(dados.bairro);
              $("#company_cidade").val(dados.localidade);
              $("#company_uf").val(dados.uf);
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
