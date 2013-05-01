namespace java service.person

struct Person {
    1: required i32 id
    2: string name;
    3: string address;
}

service PersonService {
    bool addPerson(1: Person2 person)
    Person getPerson(1: i32 id);
}
