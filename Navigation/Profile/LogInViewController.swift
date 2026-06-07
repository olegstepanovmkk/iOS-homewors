import UIKit

class LogInViewController: UIViewController {

    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Logo") ?? UIImage(systemName: "person.crop.circle.fill")
        iv.tintColor = UIColor(red: 0.28, green: 0.52, blue: 0.98, alpha: 1.0)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let loginTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Логин или email"
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.keyboardType = .emailAddress
        tf.returnKeyType = .next
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Пароль"
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        tf.returnKeyType = .done
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let showPasswordButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        btn.tintColor = .systemGray
        return btn
    }()
    
    private let logInButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Войти", for: .normal)
        btn.backgroundColor = UIColor(red: 0.28, green: 0.52, blue: 0.98, alpha: 1.0)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private var isPasswordVisible = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupActions()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
    }

    private func setupUI() {
        passwordTextField.rightView = showPasswordButton
        passwordTextField.rightViewMode = .always
        
        view.addSubview(logoImageView)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 110),
            logoImageView.heightAnchor.constraint(equalToConstant: 110),
            
            loginTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 70),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            loginTextField.heightAnchor.constraint(equalToConstant: 52),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            logInButton.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 52),
        ])
    }

    private func setupActions() {
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        showPasswordButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        loginTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        
        updateLoginButtonState()
    }

    @objc private func textFieldsDidChange() {
        updateLoginButtonState()
    }

    private func updateLoginButtonState() {
        let loginFilled = !(loginTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true)
        let passwordFilled = !(passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true)
        
        logInButton.isEnabled = loginFilled && passwordFilled
        logInButton.alpha = logInButton.isEnabled ? 1.0 : 0.6
    }

    @objc private func logInButtonTapped() {
        let login = loginTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if login == "admin" && password == "password" {
            let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: true)
        } else {
            showAlert(title: "Ошибка", message: "Неверный логин или пароль\n\nИспользуйте:\nadmin / password")
        }
    }

    @objc private func togglePasswordVisibility() {
        isPasswordVisible.toggle()
        passwordTextField.isSecureTextEntry = !isPasswordVisible
        let imageName = isPasswordVisible ? "eye" : "eye.slash"
        showPasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
