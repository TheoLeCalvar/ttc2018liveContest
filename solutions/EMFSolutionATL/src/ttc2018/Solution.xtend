package ttc2018;

import Changes.ModelChangeSet;
import SocialNetwork.SocialNetworkRoot;

public abstract class Solution {
	
	private var SocialNetworkRoot socialNetwork;

    public def SocialNetworkRoot getSocialNetwork() {
    	return socialNetwork;
    }
    
    public def void setSocialNetwork(SocialNetworkRoot network) {
    	socialNetwork = network;
    }

    public def abstract String Initial();

    public def abstract String Update(ModelChangeSet changes);
	
}
