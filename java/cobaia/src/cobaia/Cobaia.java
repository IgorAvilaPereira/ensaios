package cobaia;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.stream.Stream;

public class Cobaia {

    public static void main(String[] args) {
        InstrumentedSet<String> lista = new InstrumentedSet<>(new HashSet<String>());
        System.out.println(lista.getCont());
        lista.add("teste");
        System.out.println(lista.getCont());
        lista.add("teste");
        System.out.println(lista.getCont());
        
        InstrumentedSet<String> lista2 = new InstrumentedSet<>(new HashSet<String>());
        System.out.println(lista2.getCont());
        lista2.addAll(Arrays.asList("aa", "bb", "cc"));
        System.out.println(lista2.getCont());
        
        //java.io.Writer w = new java.io.Bu
        
        //recebeSet(lista);
    }
    
    static void recebeSet(Set s) {
        System.out.println(s.size());
    }
    
}

class InstrumentedSet<T> implements Set<T> {
    
    Set<T> s;
    
    public InstrumentedSet(Set<T> s) {
        this.s = s;
    }
    
    int cont = 0;

    public int getCont() {
        return cont;
    }

    @Override
    public int size() {
        return s.size();
    }

    @Override
    public boolean isEmpty() {
        return s.isEmpty();
    }

    @Override
    public boolean contains(Object o) {
        return s.contains(o);
    }

    @Override
    public Iterator<T> iterator() {
        return s.iterator();
    }

    @Override
    public Object[] toArray() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T> T[] toArray(T[] a) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(T e) {
        cont++;
        return s.add(e);
    }

    @Override
    public boolean remove(Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean containsAll(Collection<?> c) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean addAll(Collection<? extends T> c) {
        cont += c.size();
        return s.addAll(c);
    }

    @Override
    public boolean retainAll(Collection<?> c) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean removeAll(Collection<?> c) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void clear() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean removeIf(Predicate<? super T> filter) {
        return Set.super.removeIf(filter); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Stream<T> stream() {
        return Set.super.stream(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Stream<T> parallelStream() {
        return Set.super.parallelStream(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void forEach(Consumer<? super T> action) {
        Set.super.forEach(action); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
