#!/usr/bin/env python3
"""
Allenhouse AI Receptionist - Main Entry Point
Production-Quality UI for Allenhouse Group of Institutions
"""

import sys
import os
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtCore import QSize, Qt

# Add backend to path
backend_path = Path(__file__).parent / "backend"
sys.path.insert(0, str(backend_path))

from backend.core.app_controller import AppController


def main():
    """Initialize and run the Allenhouse AI Receptionist application."""
    
    # Create application
    app = QGuiApplication(sys.argv)
    
    # Set application metadata
    app.setApplicationName("Allenhouse AI Receptionist")
    app.setApplicationVersion("1.0.0")
    app.setApplicationDisplayName("Allenhouse AI Receptionist")
    
    # Create QML engine
    engine = QQmlApplicationEngine()
    
    # Get absolute path to QML files
    qml_dir = Path(__file__).parent / "ui" / "qml"
    main_qml = qml_dir / "main.qml"
    
    # Create controller (MVVM architecture)
    controller = AppController()
    
    # Register controller with QML context
    root_context = engine.rootContext()
    root_context.setContextProperty("appController", controller)
    
    # Load main QML file
    if not main_qml.exists():
        print(f"Error: main.qml not found at {main_qml}")
        return 1
    
    engine.load(str(main_qml))
    
    # Check for errors
    if engine.rootObjects() is None:
        print("Error: Failed to load QML files")
        return 1
    
    # Get root object and set window properties
    root = engine.rootObjects()[0]
    if root:
        root.setWidth(1920)
        root.setHeight(1080)
        root.setFlags(Qt.FramelessWindowHint)
        root.show()
    
    return app.exec()


if __name__ == "__main__":
    sys.exit(main())
