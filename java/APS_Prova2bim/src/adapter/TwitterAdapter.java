package adapter;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author iapereira
 */
public class TwitterAdapter implements ISocialAdapter {
    private final Twitter twitter;
    

    public TwitterAdapter(Twitter twitter) {
        this.twitter = twitter;
    }
    
    @Override
    public void send(String msg){
        this.twitter.sendTweet(msg);        
    }
    
}
