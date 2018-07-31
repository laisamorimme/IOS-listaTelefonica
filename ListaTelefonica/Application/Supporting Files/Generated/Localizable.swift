// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  enum App {
    /// Agenda
    static let title = L10n.tr("Localizable", "app.title")
  }

  enum Contatos {
    /// Contatos
    static let title = L10n.tr("Localizable", "contatos.title")
  }

  enum Login {
    /// Cadastrar
    static let cadastrar = L10n.tr("Localizable", "login.cadastrar")
    /// Email
    static let email = L10n.tr("Localizable", "login.email")
    /// Entrar
    static let entrar = L10n.tr("Localizable", "login.entrar")
    /// Senha
    static let senha = L10n.tr("Localizable", "login.senha")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  fileprivate static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
