package kr.or.ddit.basetech.designpattern.adapter;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import kr.or.ddit.basetech.designpattern.adapter.material.Adaptee;
import kr.or.ddit.basetech.designpattern.adapter.material.Adapter;
import kr.or.ddit.basetech.designpattern.adapter.material.Client;
import kr.or.ddit.basetech.designpattern.adapter.material.OtherConcrete;

class AdapterPatternTest {

   @Test
   void test() {
      Client client = new Client();
      client.setTarget(new OtherConcrete()); //Target을 impelement해서 가능
      client.getTarget().request();
   }

   @Test
   void testUseAdaptee() {
      
      Client client = new Client();
      client.setTarget(new Adapter(new Adaptee())); //Target의 새로운 구현채가 필요(어뎁티를 사용하기 위해서:어뎁티는 Target의 구현체가 아니기떄문에 직접적으로 연결 불가)
      client.getTarget().request();
   
   }
   
}