package ttc2018

import fr.eseo.atol.gen.ATOLGen
import fr.eseo.atol.gen.ATOLGen.Metamodel
import java.util.HashMap
import org.eclipse.papyrus.aof.core.IBox
import org.eclipse.papyrus.aof.core.IUnaryFunction
import java.util.HashSet
import org.eclipse.papyrus.aof.core.AOFFactory
import org.eclipse.papyrus.aof.core.impl.utils.DefaultObserver


@ATOLGen(transformation="src/ttc2018/Q2_ATOL.atl", metamodels = #[
	@Metamodel(name = "SN", impl=SN)
])
class Q2 implements AOFExtensions {

}
