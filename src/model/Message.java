package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the messages database table.
 * 
 */
@Entity
@Table(name="messages")
@NamedQuery(name="Message.findAll", query="SELECT m FROM Message m")
public class Message implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int helper;

	@Column(length=200)
	private String message;

	@Column(nullable=false)
	private int status;

	@Column(length=30)
	private String subject;

	@Column(length=20)
	private String time;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="Recipient", nullable=false)
	private User user1;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="Sender", nullable=false)
	private User user2;

	public Message() {
	}

	public int getHelper() {
		return this.helper;
	}

	public void setHelper(int helper) {
		this.helper = helper;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public User getUser1() {
		return this.user1;
	}

	public void setUser1(User user1) {
		this.user1 = user1;
	}

	public User getUser2() {
		return this.user2;
	}

	public void setUser2(User user2) {
		this.user2 = user2;
	}

}