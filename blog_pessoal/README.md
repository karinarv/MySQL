# Atividade DER + Banco de Dados – Blog Pessoal

## 1) Mostrar o DER 

Esse link mostrará o DER -> https://dbdesigner.page.link/GdNnntUzfy5WJbPN8

Link para o PDF -> https://github.com/karinarv/MySQL/blob/main/blog_pessoal/Blog%20Pessoal-dbdesigner.pdf

## 2) Dicionário de dados

<div>

### Postagens 
 
<table>
  <thead>
    <th> Restrições de domínio </th>
    <th> Atributos</th>
    <th> Tipo de dado</th>
    <th> Tamanho </th>
    <th> Descrição </th>
  </thead>
  <tbody>
    <tr>
      <td>PK | Not Null </td>
      <td> Id </td>
      <td> bigint</td>
      <td></td>
      <td>Código de identificação da tabela Postagens</td>
    <tr>
      <td> Not null </td>
      <td> Titulo </td>
      <td> Varchar </td>
      <td>255</td>
      <td>Titulo das Postagens</td>
    </tr>
    <tr>
      <td>Not Null</td>
      <td> Texto </td>
      <td> Varchar </td>
      <td> 1000 </td>
      <td>Textos das Postagens</td>
    </tr>
    <tr>
      <td>Not Null</td>
      <td> Data </td>
      <td> Timestamp </td>
      <td></td>
      <td>Representação da data e do horário atual levando em consideração o fuso horário</td>
    </tr>
    <tr>
      <td>FK | Not Null</td>
      <td> tema_id  </td>
      <td> bigint </td>
      <td></td>
      <td>Chave estrangeira referenciando o código da tabela Temas </td>
    </tr>
    <tr>
      <td>FK | Not Null</td>
      <td> usuario_id </td>
      <td> bigint </td>
      <td></td>
      <td>Chave estrangeira referenciando o código da tabela Temas</td>
    </tr>
  </tbody>
</table>

### Temas
<table>
  <thead>
    <th> Restrições de domínio </th>
    <th> Atributos</th>
    <th> Tipo de dado</th>
    <th> Tamanho </th>
    <th> Descrição </th>
  </thead>
  <tbody>
    <tr>
      <td>PK </td>
      <td> Id </td>
      <td> bigint</td>
      <td></td>
      <td>Código de identificação da tabela Temas</td>
    <tr>
      <td>Not Null</td>
      <td> Descricao </td>
      <td> Varchar </td>
      <td>255</td>
      <td> Descrição do tema </td>
    </tr>
  </tbody>
</table>

### Usuário
<table>
  <thead>
    <th> Restrições de domínio </th>
    <th> Atributos</th>
    <th> Tipo de dado</th>
    <th> Tamanho </th>
    <th> Descrição </th>
  </thead>
  <tbody>
    <tr>
      <td>PK</td>
      <td> Id </td>
      <td> bigint</td>
      <td></td>
      <td>Código de identificação da tabela Usuário</td>
    <tr>
      <td>Not Null</td>
      <td> Nome </td>
      <td> Varchar </td>
      <td>255</td>
      <td> Nome dos usuários</td>
    </tr>
    <tr>
      <td>Not Null</td>
      <td> Usuario </td>
      <td> Varchar </td>
      <td>255</td>
      <td> Login do usuário </td>
    </tr>
    <tr>
      <td>Not Null</td>
      <td> Senha </td>
      <td> varchar </td>
      <td>255</td>
      <td>Senha do usuário</td>
    </tr>
  </tbody>
</table>
</div>

<br>

## 3) DER do Blog Pessoal 

 
 <img src = "https://github.com/karinarv/MySQL/blob/main/blog_pessoal/DER.png"> </img>
      

## 4) Código em SQL 

         CREATE TABLE `Temas` (
         `id` INT NOT NULL AUTO_INCREMENT,
         `descricao` varchar(255) NOT NULL,
         PRIMARY KEY (`id`)
        );

        CREATE TABLE `Postagens` (
         `id` INT NOT NULL AUTO_INCREMENT,
         `titulo` varchar(255) NOT NULL,
         `texto` varchar(1000) NOT NULL,
         `data` TIMESTAMP NOT NULL,
         `tema_id` INT NOT NULL,
         `usuario_id` INT NOT NULL,
         PRIMARY KEY (`id`)
        );

        CREATE TABLE `Usuarios` (
         `id` INT NOT NULL AUTO_INCREMENT,
         `nome` varchar(255) NOT NULL,
         `usuario` varchar(255) NOT NULL,
         `senha` varchar(255) NOT NULL,
         PRIMARY KEY (`id`)
        );

        ALTER TABLE `Postagens` ADD CONSTRAINT `Postagens_fk0` FOREIGN KEY (`tema_id`) REFERENCES `Temas`(`id`);

        ALTER TABLE `Postagens` ADD CONSTRAINT `Postagens_fk1` FOREIGN KEY (`usuario_id`) REFERENCES `Usuarios`(`id`);



