


> mvn clean
> mvn compile
> mvn spring-boot:run



> mvn package
> docker build --build-arg JAR_FILE=target/spring-security-0.0.1-SNAPSHOT.jar -t org.name/spring-security:latest .
> docker run -p 8080:8080 org.name/spring-security:latest



> http -a org.name.client1:secret --form POST http://localhost:8080/oauth/token username='user' password='userpwd' grant_type='password'
HTTP/1.1 200
...

{
    "access_token": "8f5fd66c-2a2f-4354-a171-42e8c7fd635f",
    "refresh_token": "57b2d32e-f99f-4407-b814-f6793e8ee49c",
    "scope": "read write trust",
    "token_type": "bearer"
}



> http http://localhost:8080/api/all access_token=='8f5fd66c-2a2f-4354-a171-42e8c7fd635f'
HTTP/1.1 200
...

Everyone logged in can see this.



> http http://localhost:8080/api/user access_token=='8f5fd66c-2a2f-4354-a171-42e8c7fd635f'
HTTP/1.1 200
...

All members of the user role can see this.



> http http://localhost:8080/api/admin access_token=='8f5fd66c-2a2f-4354-a171-42e8c7fd635f'
HTTP/1.1 403
...

{
    "error": "access_denied",
    "error_description": "Access is denied"
}



> http -a org.name.client1:secret --form POST http://localhost:8080/oauth/token username='admin' password='adminpwd' grant_type='password'
HTTP/1.1 200
...

{
    "access_token": "b71363fb-5f25-4b44-9e57-f52fd67fb39b",
    "refresh_token": "90b483e9-c314-4668-833a-2f489d726bd0",
    "scope": "read write trust",
    "token_type": "bearer"
}


> http http://localhost:8080/api/all access_token=='b71363fb-5f25-4b44-9e57-f52fd67fb39b'
HTTP/1.1 200
...

Everyone logged in can see this.



> http http://localhost:8080/api/user access_token=='b71363fb-5f25-4b44-9e57-f52fd67fb39b'
HTTP/1.1 200
...

All members of the user role can see this.



> http http://localhost:8080/api/admin access_token=='b71363fb-5f25-4b44-9e57-f52fd67fb39b'
HTTP/1.1 200
...

Only members of the admin role can see this.



> http http://localhost:8080/token/cancel access_token=='b71363fb-5f25-4b44-9e57-f52fd67fb39b'
HTTP/1.1 200



> http http://localhost:8080/api/admin access_token=='b71363fb-5f25-4b44-9e57-f52fd67fb39b'
HTTP/1.1 401
...

{
    "error": "invalid_token",
    "error_description": "Invalid access token: b71363fb-5f25-4b44-9e57-f52fd67fb39b"
}
