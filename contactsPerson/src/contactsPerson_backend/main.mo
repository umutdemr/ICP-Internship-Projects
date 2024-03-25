import List "mo:base/List";
import AssocList "mo:base/AssocList";

// İletişim bilgilerini yönetmek için bir aktör tanımlanıyor.
actor Contact {

  // İletişim bilgilerini saklamak için bir ilişkilendirilmiş liste tanımlanıyor.
  var contacts : ContactsMap = List.nil();

  // İsim ve telefon numarası gibi veri tipleri tanımlanıyor.
  type Name = Text;
  type Phone = Nat;

  // Bir kişinin iletişim bilgilerini temsil eden bir veri yapısı tanımlanıyor.
  type Entry = {
    name : Name;
    address1 : Text;
    address2 : Text;
    email : Text;
    phone : Phone;
  };

  // İsimlerle ilişkilendirilmiş kişi girişlerini saklamak için bir veri yapısı tanımlanıyor.
  type ContactsMap = AssocList.AssocList<Name, Entry>;

  // İki ismi karşılaştıran bir fonksiyon tanımlanıyor.
  func nameEq(lhs : Name, rhs : Name) : Bool {
    return lhs == rhs;
  };

  // Yeni bir kişi girişi eklemek için bir fonksiyon tanımlanıyor.
  public func insert(name : Name, address1 : Text, address2 : Text, email : Text, phone : Phone) : async () {
     let newEntry : Entry = {
       name;
       address1;
       address2;
       email;
       phone;
     };

     // Eğer kişi zaten listede varsa, güncellenir; yoksa yeni bir giriş eklenir.
     let (newContacts, _) = AssocList.replace(
       contacts,
       name,
       func(n: Name, m: Name) : Bool { n == m }, // İsimleri karşılaştırmak için bir fonksiyon kullanılır.
       ?newEntry // Yeni giriş, isteğe bağlı (?newEntry) olarak eklenir.
     );
     contacts := newContacts; // Kişiler listesi güncellenir.
  };

  // Bir kişinin iletişim bilgilerini aramak için bir fonksiyon tanımlanıyor.
  public query func lookup(name : Name) : async ?Entry {
    return AssocList.find(contacts, name, nameEq); // İsimle eşleşen bir kişi girişi bulunur.
  };
};
