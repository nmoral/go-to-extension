import * as vscode from 'vscode';

/**
 * Extension de navigation intelligente pour VS Code
 */
export function activate(context: vscode.ExtensionContext) {
  console.log('Code Navigator Pro est maintenant actif!');

  // Enregistrer les commandes
  const smartGoToDefinition = vscode.commands.registerCommand(
    'code-navigator-pro.smartGoToDefinition',
    () => {
      vscode.window.showInformationMessage(
        'Smart Go to Definition - Fonctionnalité en cours de développement'
      );
    }
  );

  const contextAwareReferences = vscode.commands.registerCommand(
    'code-navigator-pro.contextAwareReferences',
    () => {
      vscode.window.showInformationMessage(
        'Context-Aware References - Fonctionnalité en cours de développement'
      );
    }
  );

  const codeMetrics = vscode.commands.registerCommand('code-navigator-pro.codeMetrics', () => {
    vscode.window.showInformationMessage('Code Metrics - Fonctionnalité en cours de développement');
  });

  const dependencyVisualization = vscode.commands.registerCommand(
    'code-navigator-pro.dependencyVisualization',
    () => {
      vscode.window.showInformationMessage(
        'Dependency Visualization - Fonctionnalité en cours de développement'
      );
    }
  );

  const addAnnotation = vscode.commands.registerCommand('code-navigator-pro.addAnnotation', () => {
    vscode.window.showInformationMessage(
      'Add Annotation - Fonctionnalité en cours de développement'
    );
  });

  const refactoringSuggestions = vscode.commands.registerCommand(
    'code-navigator-pro.refactoringSuggestions',
    () => {
      vscode.window.showInformationMessage(
        'Refactoring Suggestions - Fonctionnalité en cours de développement'
      );
    }
  );

  // Ajouter les commandes au contexte
  context.subscriptions.push(
    smartGoToDefinition,
    contextAwareReferences,
    codeMetrics,
    dependencyVisualization,
    addAnnotation,
    refactoringSuggestions
  );
}

/**
 * Fonction appelée lors de la désactivation de l'extension
 */
export function deactivate() {
  console.log('Code Navigator Pro a été désactivé');
}
