package kr.or.ddit.basetech.designpattern.adapter.material;

public class Adapter implements Target {
   //어뎁티가 없이 어뎁터를 생성할 수 있으면 안됌
   //어뎁티는 기본생성자 없음.
   
   
   //한번 어뎁티 정해지면 변경 불가
   private final Adaptee adaptee;
   
   public Adapter(Adaptee adaptee) {
      super();
      this.adaptee = adaptee;
   }

   @Override
   public void request() {
      adaptee.specificRequest();
   }

}