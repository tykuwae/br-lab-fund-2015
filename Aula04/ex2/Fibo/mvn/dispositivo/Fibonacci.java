/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mvn.dispositivo;

import mvn.Bits8;
import mvn.controle.MVNException;

/**
 *
 * @author mjunior
 */
public class Fibonacci implements mvn.Dispositivo{
    Bits8 v0, v1;

    public Fibonacci() {
        v0 = new Bits8(0);
        v1 = new Bits8(0);
        
    }
    
    @Override
    public void escrever(Bits8 in) throws MVNException {

        v0=v1;
        v1=in;
        
        
    }

    @Override
    public Bits8 ler() throws MVNException {
        Bits8 resultado;
        resultado = new Bits8(0);
        resultado.add(v0);
        resultado.add(v1);
        escrever(resultado);
        return resultado;      
        
        //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean podeLer() {
       return true;
    }

    @Override
    public boolean podeEscrever() {
        return true;
    }

    @Override
    public void reset() throws MVNException {
        v0=null;
        v1=v0;
        v0 = new Bits8(0);
        v1 = new Bits8(0);
       
    }

    @Override
    public Bits8 skip(Bits8 val) throws MVNException {
        int n;
        n = val.toInt();
        while(n<0){
            ler();
        }
        return ler();
        
    }

    @Override
    public Bits8 position() throws MVNException {
        return v0;
    }

    @Override
    public Bits8 size() throws MVNException {
        return v1;
    }
    
}
