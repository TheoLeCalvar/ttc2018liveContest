package ttc2018

import org.eclipse.emf.ecore.EObject
import org.eclipse.papyrus.aof.core.IBox
import org.eclipse.papyrus.aof.core.IMetaClass
import org.eclipse.papyrus.aof.core.IOne
import org.eclipse.papyrus.aof.core.IUnaryFunction

interface AOFExtensions {
	def sum(IBox<Integer> b) {
		new Sum(b).result as IOne<Integer>
	}
	def <C> allContents(EObject eo, IMetaClass<C> c) {
		AllContents._allContents(eo, c)
	}
	def <E> take(IBox<E> b, int n) {
		new Take(b, n).result
	}
	def <E> drop(IBox<E> b, int n) {
		new Drop(b, n).result
	}
	def <E> subSequence(IBox<E> b, int l, int u) {
		if(l > 1) {
			b.drop(l - 1)
		}
		b.take(u - l + 1)
	}
	def <E> sortedBy(IBox<E> b, IUnaryFunction<E, IBox<? extends Comparable<?>>>...bodies) {
		new SortedBy(b, bodies as IUnaryFunction<?, ?>[] as IUnaryFunction<E, IOne<? extends Comparable<?>>>[]).result
	}
}