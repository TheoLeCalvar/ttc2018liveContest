package ttc2018;

import SocialNetwork.Post;
import SocialNetwork.SocialNetworkRoot;
import fr.eseo.atol.gen.ATOLGen;
import fr.eseo.atol.gen.AbstractRule;
import java.util.HashMap;
import java.util.Map;
import org.eclipse.papyrus.aof.core.IBox;
import ttc2018.AOFExtensions;
import ttc2018.SN;

@ATOLGen(transformation = "src/ttc2018/Q1_ATOL.atl", metamodels = { @ATOLGen.Metamodel(name = "SN", impl = SN.class) })
@SuppressWarnings("all")
public class Q1 implements AOFExtensions {
  public final SN SNMM = new SN();
  
  private Map<SocialNetworkRoot, IBox<String>> _topPostsCache = new HashMap();
  
  public IBox<String> _topPosts(final SocialNetworkRoot self_) {
    IBox<String> ret = _topPostsCache.get(self_);
    if(ret == null) {
    	ret = subSequence(sortedBy(
    		SNMM._posts(self_),
    		(e_1) ->
    			_score(e_1),
    		(e_2) ->
    			SNMM._timestamp(e_2)
    	), 1, 3).collectMutable((e_3) ->
    		e_3 == null ?
    			AbstractRule.emptySequence()
    		:
    			SNMM._id(e_3)
    	);
    	_topPostsCache.put(self_, ret);
    }
    return ret;
  }
  
  public IBox<String> topPosts(final IBox<? extends SocialNetworkRoot> b) {
    return b.collectMutable((e876435) ->
    	(e876435 == null) ?
    		AbstractRule.emptySequence()
    	:
    		_topPosts(e876435)
    );
  }
  
  private Map<Post, IBox<Integer>> _scoreCache = new HashMap();
  
  public IBox<Integer> _score(final Post self_) {
    IBox<Integer> ret = _scoreCache.get(self_);
    if(ret == null) {
    	ret = AbstractRule.let(
    		allContents(self_, SN.Comment),
    		(allComments_4) ->
    			allComments_4.size(
    			).collect((e876435) ->
    				10 * e876435
    			).zipWith(sum(allComments_4.collectMutable((e_5) ->
    				e_5 == null ?
    					AbstractRule.emptySequence()
    				:
    					SNMM._likedBy(e_5).size(
    					)
    			)), (e876435, e876435_2) ->
    				e876435 + e876435_2
    			)
    	);
    	_scoreCache.put(self_, ret);
    }
    return ret;
  }
  
  public IBox<Integer> score(final IBox<? extends Post> b) {
    return b.collectMutable((e876435) ->
    	(e876435 == null) ?
    		AbstractRule.emptySequence()
    	:
    		_score(e876435)
    );
  }
}
