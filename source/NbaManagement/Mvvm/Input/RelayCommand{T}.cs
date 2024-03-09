using System;

namespace NbaManagement.Mvvm.Input
{
    public class RelayCommand<T> : RelayCommandBase, IRelayCommand<T>
    {
        private readonly Action<T> _execute;

        private readonly Predicate<T> _canExecute;
        
        public RelayCommand(Action<T> execute, Predicate<T> canExecute = null)
        {
            _execute = execute ?? throw new ArgumentNullException(nameof(execute));
            _canExecute = canExecute;
        }

        public override void Execute(object parameter) => Execute((T)parameter);

        public void Execute(T parameter) => _execute(parameter);

        public override bool CanExecute(object parameter) => CanExecute((T)parameter);

        public bool CanExecute(T parameter) => _canExecute?.Invoke(parameter) != false;
    }
}