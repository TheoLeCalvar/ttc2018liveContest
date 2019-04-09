package ttc2018

import fr.eseo.atol.gen.ATOLGen
import fr.eseo.atol.gen.ATOLGen.Metamodel
import org.eclipse.papyrus.aof.core.IBox
import org.eclipse.papyrus.aof.core.IUnaryFunction

@ATOLGen(transformation="src/ttc2018/Q2_ATOL.atl", metamodels = #[
	@Metamodel(name = "SN", impl=SN)
])
class Q2 implements AOFExtensions {

	// custom iterator
	def <E> connectedComponents(IBox<E> it, IUnaryFunction<E, IBox<E>> accessor) {
		new ConnectedComponents(it, accessor).result
	}

	// standard operation implemented using select and notEmpty
	def <E> includes(IBox<E> it, E e) {
		select[it === e].notEmpty
	}
}
