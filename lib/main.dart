import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  //int _counter = 0;
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultadoImc = '';
  String classificacao = '';

  void _incrementCounter() {
    setState(() {

      //_counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
        
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Informe seu peso e altura para verificar seu IMC',
              ),

              const SizedBox(height:16),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controllerPeso,
                decoration: const InputDecoration(
                  labelText: 'Peso',
                  hintText: 'Digite o seu peso',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))
                  ),
                ),
              ),
            
              const SizedBox(height:16),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controllerAltura,
                decoration: const InputDecoration(
                  labelText: 'Altura',
                  hintText: 'Digite a sua altura',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))
                  )
                ),
              ),

              const SizedBox(height:16),

              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      num valorAux = (num.parse(controllerPeso.text) / 
                                    (num.parse(controllerAltura.text) * num.parse(controllerAltura.text))); 

                      if (valorAux < 16) {
                        classificacao = 'Magreza grave';
                      } 
                      else if (valorAux >= 16 && valorAux < 17) {
                        classificacao = 'Magreza moderada';
                      }
                      else if (valorAux >= 17 && valorAux < 18.5) {
                        classificacao = 'Magreza leve';
                      }
                      else if (valorAux >= 18.5 && valorAux < 25) {
                        classificacao = 'Saudável';
                      }
                      else if (valorAux >= 25 && valorAux < 30) {
                        classificacao = 'Sobrepeso';
                      }
                      else if (valorAux >= 30 && valorAux < 35) {
                        classificacao = 'Obesidade Grau I';
                      }
                      else if (valorAux >= 35 && valorAux < 40) {
                        classificacao = 'Obesidade Grau II (severa)';
                      }
                      else if (valorAux >= 40) {
                        classificacao = 'Obesidade Grau III (mórbida)';
                      }  

                      resultadoImc = valorAux.toStringAsFixed(1);
                    });
                  }, 
                  child: const Text('Calcular')
                ),
              ),

              const SizedBox(height:32),

              Text(
                resultadoImc,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height:16),

              Text(
                classificacao,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            resultadoImc = '';
            classificacao = '';
            controllerAltura.text = '';
            controllerPeso.text = '';
          });
        },
        tooltip: 'Increment',
        child: const Text('Limpar'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
