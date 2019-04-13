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

	// custom iterator
	def <E> connectedComponents(IBox<E> it, IUnaryFunction<E, IBox<E>> accessor) {
		new ConnectedComponents(it, accessor).result
	}

	val includesCache = new HashMap<Pair<IBox<?>, ?>, IBox<Boolean>>
	// standard operation implemented using select and notEmpty
	def <E> includes(IBox<E> it, E e) {
		includesCache.computeIfAbsent(it -> e)[
			key.select[it === e].notEmpty
		]
	}

	// assuming source boxes are sets
	def <E> IBox<E> intersection(IBox<E> it, IBox<E> o) {
		new Intersection(it, o).result
/*
		val ret = AOFFactory.INSTANCE.createSet
		val its = new HashSet<E>(it.length)
		for(e : it) {
			its.add(e)
		}
		val os = new HashSet<E>(o.length)
		for(e : o) {
			os.add(e)
			if(its.contains(e)) {
				ret.add(e)
			}
		}
		it.addObserver(new DefaultObserver<E> {
			override added(int index, E element) {
				its.add(element)
				if(os.contains(element)) {
					ret.add(element)
				}
			}
			override moved(int newIndex, int oldIndex, E element) {
				// nothing to do
			}
			override removed(int index, E element) {
				its.remove(element)
				ret.remove(element)
			}
			override replaced(int index, E newElement, E oldElement) {
				removed(index, oldElement)
				added(index, newElement)
			}
		})
		o.addObserver(new DefaultObserver<E> {
			override added(int index, E element) {
				os.add(element)
				if(its.contains(element)) {
					ret.add(element)
				}
			}
			override moved(int newIndex, int oldIndex, E element) {
				// nothing to do
			}
			override removed(int index, E element) {
				o.remove(element)
				ret.remove(element)
			}
			override replaced(int index, E newElement, E oldElement) {
				removed(index, oldElement)
				added(index, newElement)
			}
		})
		ret
*/
	}
}
