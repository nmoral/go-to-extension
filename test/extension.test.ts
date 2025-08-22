import * as assert from 'assert';
import * as vscode from 'vscode';

suite('Extension Test Suite', () => {
    vscode.window.showInformationMessage('Démarrage des tests de l\'extension.');

    test('Extension devrait être activée', () => {
        // Vérifier que l'extension est activée
        const extension = vscode.extensions.getExtension('code-navigator-pro');
        assert.ok(extension);
    });

    test('Commandes devraient être disponibles', async () => {
        // Vérifier que les commandes sont enregistrées
        const commands = await vscode.commands.getCommands();
        assert.ok(commands.includes('code-navigator-pro.smartGoToDefinition'));
        assert.ok(commands.includes('code-navigator-pro.contextAwareReferences'));
        assert.ok(commands.includes('code-navigator-pro.codeMetrics'));
        assert.ok(commands.includes('code-navigator-pro.dependencyVisualization'));
        assert.ok(commands.includes('code-navigator-pro.addAnnotation'));
        assert.ok(commands.includes('code-navigator-pro.refactoringSuggestions'));
    });
});
