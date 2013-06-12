def revision_history_with
	stub_binary("svn") do 
		yield
	end
end

def single_change_set_with_two_files
<<-EOS
Index: ordercomplete/ReturnOrderCompleteService/src/tst/oms/v1/ro/complete/RefundInvoiceResponseProcess.java
===================================================================
--- ordercomplete/ReturnOrderCompleteService/src/tst/oms/v1/ro/complete/RefundInvoiceResponseProcess.java	(revision 540270)
+++ ordercomplete/ReturnOrderCompleteService/src/tst/oms/v1/ro/complete/RefundInvoiceResponseProcess.java	(revision 540271)
@@ -1,8 +1,6 @@
 package tst.oms.v1.ro.complete;
 
-import tst.oms.v1.dto.domain.OrderEntityDetail;
-import tst.orderstatus.v4.beans.OrderStatusResponseDTO;
-import tst.statemachine.v1.dto.domain.EntityProxy;
+import tst.schemas.refundinvoiceresponse.v1.RefundInvoiceResponse;
 
 public interface RefundInvoiceResponseProcess {
 
@@ -10,5 +8,5 @@
      * @param entity
      * @return
      */
-    public OrderStatusResponseDTO getRefundOrderInvoiceResponseDetails(EntityProxy<OrderEntityDetail>entity);
+    public void handleRefundOrderInvoiceResponse(RefundInvoiceResponse refundInvoiceResponse);
 }
Index: ordercomplete/ReturnOrderCompleteServiceImpl/test/tst/oms/v1/ro/complete/impl/RefundInvoiceResponseProcessImplTest.java
===================================================================
--- ordercomplete/ReturnOrderCompleteServiceImpl/test/tst/oms/v1/ro/complete/impl/RefundInvoiceResponseProcessImplTest.java	(revision 0)
+++ ordercomplete/ReturnOrderCompleteServiceImpl/test/tst/oms/v1/ro/complete/impl/RefundInvoiceResponseProcessImplTest.java	(revision 540271)
@@ -0,0 +1,19 @@
+package tst.oms.v1.ro.complete.impl;
+
+import org.junit.Test;
+
+import tst.oms.v1.ro.complete.exception.RefundInvoiceResponseException;
+import tst.schemas.refundinvoiceresponse.v1.RefundInvoiceResponse;
+
+public class RefundInvoiceResponseProcessImplTest {
+
+    @Test(expected = RefundInvoiceResponseException.class)
+    public final void testHandleRefundOrderInvoiceResponse() {
+        final RefundInvoiceResponseProcessImpl impl = new RefundInvoiceResponseProcessImpl();
+        final RefundInvoiceResponse refundInvoiceResponse = new RefundInvoiceResponse();
+        refundInvoiceResponse.setStatus(false);
+        refundInvoiceResponse.setOrderNumber("RET23456");
+        impl.handleRefundOrderInvoiceResponse(refundInvoiceResponse);
+    }
+
+}
EOS
end

def history
<<-EOS
------------------------------------------------------------------------
r540270 | ubollempalli | 2013-01-24 21:06:39 -0500 (Thu, 24 Jan 2013) | 2 lines

HWRF12-292:As a DE i want to patch vertex ISO and VDEV to address new vertex issues-Reverted to revision 541607

------------------------------------------------------------------------
r540271| kvolety | 2013-01-24 20:19:21 -0500 (Thu, 24 Jan 2013) | 1 line

ORDR-2536 Fixing ORDR-2536 scripts
------------------------------------------------------------------------
EOS
end
