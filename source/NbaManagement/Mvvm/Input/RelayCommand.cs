using System;

namespace NbaManagement.Mvvm.Input
{
    public class RelayCommand : RelayCommandBase
    {
        private readonly Action _execute;

        private readonly Func<bool> _canExecute;
        
        public RelayCommand(Action execute, Func<bool> canExecute = null)
        {
            _execute = execute ?? throw new ArgumentNullException(nameof(execute));
            _canExecute = canExecute;
        }

        public override void Execute(object parameter) => _execute();

        public override bool CanExecute(object parameter) => _canExecute?.Invoke() != false;
    }
}