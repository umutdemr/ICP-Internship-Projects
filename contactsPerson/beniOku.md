# contactsPerson
# İletişim Yönetim Sistemi Projesi
Bu proje, iletişim bilgilerini yönetmek için bir sistem sunar. 
- İletişim bilgileri, 
- kişilerin adları 
- adresleri 
- e-posta adresleri 
- telefon numaralarını içerir. 

# Proje, kullanıcıların bu bilgilere erişebilmesi, yeni kişiler ekleyebilmesi ve varolan kişilerin bilgilerini güncelleyebilmesini sağlar.

# API Kılavuzu
- insert(name, address1, address2, email, phone): Yeni bir kişi girişi eklemek için kullanılır. Parametreler: kişinin adı, adresleri, e-posta adresi ve telefon numarası.
- lookup(name): Belirli bir kişinin iletişim bilgilerini aramak için kullanılır. Parametre: aranan kişinin adı.

```
// Yeni bir kişi girişi eklemek
Contact.insert("John Doe", "123 Main St", "Apt 4B", "john@example.com", 1234567890)

// Bir kişinin iletişim bilgilerini aramak
let result = Contact.lookup("John Doe")
match result? {
  None => // Kişi bulunamadı
    error("Kişi bulunamadı"),
  Some(entry) => // Kişi bulundu
    // İletişim bilgilerini kullan
    let name = entry.name
    let email = entry.email
    // ...
}
```
