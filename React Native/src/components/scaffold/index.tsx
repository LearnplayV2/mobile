import { MaterialIcons } from '@expo/vector-icons';
import { useNavigation } from '@react-navigation/native';
import {
    HStack,
    Icon,
    IconButton,
    StatusBar,
    Text,
} from 'native-base';
import { SafeAreaView } from 'react-native-safe-area-context';
import { THEME, TITLE } from '../../config';

export default function Scaffold({ children }: { children: React.ReactNode }) {
    return (
        <SafeAreaView style={{flex: 1, backgroundColor: THEME.primary}}>
            <AppBar />
            {children}
        </SafeAreaView>
    );
}

export function AppBar() {
    const navigation = useNavigation() as { openDrawer: () => void };

    return (
        <>
            <StatusBar
                backgroundColor={THEME.primary}
                barStyle="light-content"
            />
            <HStack
                bg={THEME.secondary}
                px="1"
                py="3"
                justifyContent="space-between"
                alignItems="center"
                w="100%"
            >
                <HStack alignItems="center">
                    <IconButton
                        onPress={() => navigation.openDrawer()}
                        icon={
                            <Icon
                                size="28"
                                as={MaterialIcons}
                                name="menu"
                                color="white"
                            />
                        }
                    />
                    <Text
                        color="#22C54D"
                        fontSize={16}
                        fontWeight="bold"
                        marginLeft="10px"
                    >
                        {TITLE}
                    </Text>
                </HStack>
            </HStack>
        </>
    );
}
