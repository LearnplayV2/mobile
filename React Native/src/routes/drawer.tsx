import { createDrawerNavigator } from '@react-navigation/drawer';
import { NavigationContainer } from '@react-navigation/native';
import { background } from 'native-base/lib/typescript/theme/styled-system';
import HomePage from '../pages/home';
import RegisterPage from '../pages/register';
import { THEME } from '../config';

const Drawer = createDrawerNavigator();

export default (props: any) => {
    return (
        // @ts-ignore
        <NavigationContainer>
            {/* @ts-ignore */}
            <Drawer.Navigator 
                useLegacyImplementation={true} 
                initialRouteName="Home"
                screenOptions={{headerShown: false}}
            >
                <Drawer.Screen name="Home" component={HomePage} options={{title: 'Página Inicial'}} />
                <Drawer.Screen name="Register" component={RegisterPage} />
            </Drawer.Navigator>
        </NavigationContainer>
    );
};
