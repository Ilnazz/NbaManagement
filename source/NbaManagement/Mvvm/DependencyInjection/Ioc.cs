using System;

namespace NbaManagement.Mvvm.DependencyInjection
{
    public class Ioc : IServiceProvider
    {
        public static Ioc Default { get; } = new Ioc();

        private IServiceProvider _serviceProvider;

        public void ConfigureServices(IServiceProvider serviceProvider)
        {
            if (_serviceProvider != null)
                throw new InvalidOperationException("The service provider has already been configured.");
                
            _serviceProvider = serviceProvider ?? throw new ArgumentNullException(nameof(serviceProvider));
        }

        public object GetService(Type serviceType)
        {
            if (serviceType is null)
                throw new ArgumentNullException(nameof(serviceType));
            
            if (_serviceProvider is null)
                throw new InvalidOperationException("The service provider has not been configured yet.");
            
            return _serviceProvider.GetService(serviceType);
        }
    }
}