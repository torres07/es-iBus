package iBus.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

@Entity(name="motorista")
public class Motorista {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@NotNull
	private String nome;
	
	@NotNull
	private String senha;
	
	private String telefone;
	
	private double somaAvaliacoes;
	
	@OneToMany(mappedBy="motorista", targetEntity=Avaliacao.class, fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Avaliacao> avaliacoes;
	
	public Motorista(){}
	
	public Motorista(Integer id) {
		this.id = id;
	}
	
	public List<Avaliacao> getAvaliacoes() {
		return avaliacoes;
	}

	public void setAvaliacoes(List<Avaliacao> avaliacoes) {
		this.avaliacoes = avaliacoes;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public double getSomaAvaliacoes() {
		return somaAvaliacoes;
	}

	public void setSomaAvaliacoes(double somaAvaliacoes) {
		this.somaAvaliacoes = somaAvaliacoes;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public void somarAvaliação(double n) {
		this.somaAvaliacoes += n;
	}

}
