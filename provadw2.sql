Create database provadw2;
use provadw2;

create table TestScaffolding (
id int auto_increment primary key,
tipo text,
classe text,
package text,
nome text
);

create table Cut(
id int auto_increment primary key,
componentName text,
package text
);

create table Internal(
id int auto_increment primary key,
id_TestScaffolding  int,
id_Cut int,
FOREIGN KEY (id_TestScaffolding) REFERENCES TestScaffolding(id),
FOREIGN KEY (id_Cut) REFERENCES Cut(id)
);

create table TestHierarchical(
id int auto_increment primary key,
nivel text
);

create table Hardware(
id int auto_increment primary key,
deviceNumber text,
modelNumber text,
descricao text
);

create table Software(
id int auto_increment primary key,
os text,
softwareVersion text,
tipo text,
descricao text
);

create table Enviromental(
id int auto_increment primary key,
id_Hardware int,
id_Software int,
FOREIGN KEY (id_Hardware) REFERENCES Hardware(id),
FOREIGN KEY (id_Software) REFERENCES Software(id)
);

create table TestDependency(
id int auto_increment primary key,
descricao text
);

create table TestCase(
id int auto_increment primary key,
testName text,
classe text,
package text,
id_Hierarchical int,
id_Internal int,
id_Enviromental int,
id_Dependency int,
FOREIGN KEY (id_Hierarchical) REFERENCES TestHierarchical(id),
FOREIGN KEY (id_Internal) REFERENCES Internal(id),
FOREIGN KEY (id_Enviromental) REFERENCES Enviromental(id),
FOREIGN KEY (id_Dependency) REFERENCES Dependency(id)
);

