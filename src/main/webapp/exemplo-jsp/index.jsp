<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Calculo de IMC</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  </head>
  <body>
    <div class="col-md-12">
        <div class="modal-dialog" style="margin-bottom:0">
            <div class="modal-content">
                <div class="panel-heading">
                    <h3 class="panel-title">IMC</h3>
                </div>
                <div class="panel-body">
                <form name="formulario">
                    <fieldset>
                        <div class="form-group">
								
                                <div class="form-group">
                                    <input class="form-control" id= "altura" type="text" name="Altura" placeholder="Altura" >
                                </div>		
                                <div class="form-group">
									<input class="form-control" id = "peso" type="text" name="Peso" placeholder="Peso" >                                </div>					
							<p>Sexo:</p>
							<select id = "sexo" name="Sexo" placeholder="Sexo">
							  <option></option>
                                <option value = "m">Masculino</option>
							  <option value = "f">Feminino</option>
							
							</select>
                        </div>
                        <button class="btn btn-sm btn-success">Calcular</button>
                    </fieldset>
                </form>
            </div>
        </div>

<%
java.util.Formatter formatter = new java.util.Formatter();
//Declarando e inicializando variaveis
String resultado = "";
String alerta = "";
float peso = 0;
float altura = 0;
String p = request.getParameter("Peso");
String h = request.getParameter("Altura");
String sexo = request.getParameter("Sexo");
/*-------------------------------------------*/
if(p != null && h != null && sexo != null ){
	//Iniciando calculo do IMC
	peso = Float.valueOf(p).floatValue();
	altura = Float.valueOf(h).floatValue();
	float quadrado = (altura * altura);    
	float imc = (peso/quadrado);

	//Imprimindo os resultados
	System.out.println(sexo);
	System.out.println(imc);
	if(sexo.equals("f")){
			if(imc <= 19.1){
				resultado = "IMC = " + formatter.format("%.2f", imc) + ". Voce esta abaixo do peso ideal!";
				
	        } else if(imc > 19.1 && imc < 25.8){
	        	resultado = "IMC = " + formatter.format("%.2f", imc) + ". Voce esta na faixa de peso ideal!";
	        	
			} else if(imc >= 25.8 && imc < 27.3){
				resultado = "IMC = " + formatter.format("%.2f", imc) + ". Voce esta com sobrepeso!";
				
			} else if(imc >= 27.3){
				resultado = "IMC = " + formatter.format("%.2f", imc) + ". Voce esta com obesidade!";
				
			} 
			
	}

	if(sexo.equals("m")){
	        if(imc <= 20.7){
	        	resultado = "IMC = " + formatter.format("%.2f", imc) + ". Voce esta abaixo do peso ideal!";
	   
	        } else if(imc > 20.7 && imc < 26.4){
	        	resultado = "IMC = " + formatter.format("%.2f", imc) + ". Voce esta na faixa de peso ideal!";
	  
			} else if(imc >= 26.4 && imc < 27.8){
				resultado = "IMC = " + formatter.format("%.2f", imc) + ". Voce esta com sobrepeso!";
			
			} else if(imc >= 27.8){
				resultado = "IMC = " + formatter.format("%.2f", imc) + ". Voce esta com obesidade!";
			
			} 
	}
} else{
	resultado = "ENTRADA DE PESO COM PONTO FINAL";
	
	}
%>
      
      <div class="alert alert-<%=alerta%>" role="alert" style="margin-top:45px"><%=resultado%></div>
    </div>
  </body>
</html>