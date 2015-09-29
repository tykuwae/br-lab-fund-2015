/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mvn.dispositivo;

import mvn.Bits8;
import mvn.Dispositivo;
import mvn.controle.MVNException;

/**
 *
 * @author mjunior
 */
public class Fibonacci implements Dispositivo {
  
	public int v0;
	public int v1;
	
  public Fibonacci (){
    //      Construtor: inicializa em 0 os atributos v0 e v1, os primeiros
    // números inteiros da sequência de Fibonacci
	  v0 = 0;
	  v1 = 0;
  }

  public int getV1(){
	  return v1;
  }
  

  public int getV0(){
	  return v0;
  }
  
  public void escrever(Bits8 in) throws MVNException {
// - escrever: atualiza v1 para o valor passado, guardando o antigo valor
// de v1 no atributo v0
	  v0 = v1;
	  v1 = in.toInt();
  }


  public Bits8 ler() throws MVNException{
	  
	int nextFibo = v1 + v0;
	v0 = v1;
	v1 = nextFibo;
	
	return new Bits8(v1);
	
  // atualizando v0 e v1 como se v0+v1 tivesse sido passado como
  // parâmetro para o método escrever.
  //: retorna o valor seguinte da sequência de Fibonacci, v0+v1,
  } 

  public boolean podeLer(){
    return true;
  } 
  public boolean podeEscrever(){
    return true;
  }
  public void reset(){
  // reinicializa v0 e v1 em 0
	  v0 = 0;
	  v1 = 1;
  } 
  public Bits8 skip(Bits8 val) throws MVNException {

  // (n): salta n valores da sequência de Fibonacci, como se o
  // método ler fosse chamado n vezes; retorna então o valor seguinte
  // da sequência da mesma forma que seria feito com uma nova
  // chamada do método ler
	int n = val.toInt();
	while (n > 1){
		this.ler();
		n --;
	}
	return this.ler();
  } 
  public Bits8 position() throws MVNException {
	return null;
  //: retorna o valor de v0
  } 
  public Bits8 size() throws MVNException {
	return null;
    //: retorna o valor de v1
  }


}
