namespace aman.reuse;

//resue type like data element
type Guid : String(32);

//aspect - group of fields which can be reused in multiple entities
aspect address {
    street: String(80);
    sector: String(80);
    city: String(80);
    country: String(80);
}
