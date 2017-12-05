package iBus.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity(name="usuario")
public class Usuario {
	@Id
	@NotNull
	private Integer matricula;
	
	@NotNull
	@Size(min=2, max=80, message="O tamanho deve ser entre {min} e {max}")
	private String nome;
	
	@NotNull
	@Size(min=2, max=80, message="Sua senha deve ser entre {min} e {max} caracteres")
	private String senha;
	
	@NotNull
	private String tipo;
	
	public Usuario() {	}
	
	public Usuario(Integer matricula){
		this.matricula = matricula;
	}
		
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public Integer getMatricula() {
		return matricula;
	}

	public void setMatricula(Integer matricula) {
		this.matricula = matricula;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
}
